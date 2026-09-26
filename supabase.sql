-- Run this in Supabase SQL Editor.
create table if not exists public.topics (
 id uuid primary key,
 user_id uuid references auth.users(id) on delete cascade not null,
 subject text not null, name text not null, mastery text not null default 'Not started',
 created_at timestamptz default now()
);
create table if not exists public.study_sessions (
 id uuid primary key, user_id uuid references auth.users(id) on delete cascade not null,
 topic_id uuid references public.topics(id) on delete cascade not null,
 date date not null, hours numeric not null, type text not null, created_at timestamptz default now()
);
create table if not exists public.tests (
 id uuid primary key, user_id uuid references auth.users(id) on delete cascade not null,
 topic_id uuid references public.topics(id) on delete cascade not null,
 date date not null, questions int not null, score numeric not null, percent numeric not null,
 attempt int not null, created_at timestamptz default now()
);
create table if not exists public.revisions (
 id uuid primary key, user_id uuid references auth.users(id) on delete cascade not null,
 topic_id uuid references public.topics(id) on delete cascade not null,
 date date not null, next_date date, created_at timestamptz default now()
);
alter table public.topics enable row level security;
alter table public.study_sessions enable row level security;
alter table public.tests enable row level security;
alter table public.revisions enable row level security;
create policy "own topics" on public.topics for all using (auth.uid()=user_id) with check (auth.uid()=user_id);
create policy "own study" on public.study_sessions for all using (auth.uid()=user_id) with check (auth.uid()=user_id);
create policy "own tests" on public.tests for all using (auth.uid()=user_id) with check (auth.uid()=user_id);
create policy "own revisions" on public.revisions for all using (auth.uid()=user_id) with check (auth.uid()=user_id);
