-- Glass Player: Supabase setup
-- Paste this whole file into Supabase → SQL Editor → New query → Run.
-- Safe to run more than once.

-- 1. Song list (shared by everyone you give an account to)
create table if not exists public.tracks (
  id          uuid primary key default gen_random_uuid(),
  title       text not null,
  artist      text not null default 'Unknown Artist',
  album       text not null default '',
  file_name   text,
  size        bigint,
  duration    real not null default 0,
  path        text not null,          -- where the audio file lives in the "music" bucket
  cover_path  text,                   -- album art in the same bucket, if the file had any
  color1      text,
  color2      text,
  added_at    timestamptz not null default now(),
  added_by    uuid default auth.uid()
);

-- 2. Likes (each person has their own)
create table if not exists public.likes (
  user_id   uuid not null default auth.uid() references auth.users on delete cascade,
  track_id  uuid not null references public.tracks on delete cascade,
  primary key (user_id, track_id)
);

-- 3. Only signed-in people can see or change anything
alter table public.tracks enable row level security;
alter table public.likes  enable row level security;

drop policy if exists "members read tracks"   on public.tracks;
drop policy if exists "members add tracks"    on public.tracks;
drop policy if exists "members edit tracks"   on public.tracks;
drop policy if exists "members delete tracks" on public.tracks;
drop policy if exists "own likes"             on public.likes;

create policy "members read tracks"   on public.tracks for select to authenticated using (true);
create policy "members add tracks"    on public.tracks for insert to authenticated with check (true);
create policy "members edit tracks"   on public.tracks for update to authenticated using (true);
create policy "members delete tracks" on public.tracks for delete to authenticated using (true);
create policy "own likes" on public.likes for all to authenticated
  using (user_id = auth.uid()) with check (user_id = auth.uid());

-- 4. Private file storage for the songs (not public, 50 MB per file)
insert into storage.buckets (id, name, public, file_size_limit)
values ('music', 'music', false, 52428800)
on conflict (id) do update set public = false;

drop policy if exists "members read music"   on storage.objects;
drop policy if exists "members upload music" on storage.objects;
drop policy if exists "members update music" on storage.objects;
drop policy if exists "members delete music" on storage.objects;

create policy "members read music"   on storage.objects for select to authenticated using (bucket_id = 'music');
create policy "members upload music" on storage.objects for insert to authenticated with check (bucket_id = 'music');
create policy "members update music" on storage.objects for update to authenticated using (bucket_id = 'music');
create policy "members delete music" on storage.objects for delete to authenticated using (bucket_id = 'music');
