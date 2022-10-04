drop table if exists "users" cascade;
drop table if exists "categories" cascade;
drop table if exists "compilations" cascade;
drop table if exists "participation_requests" cascade;
drop table if exists "events" cascade;
drop table if exists "comments" cascade;
drop table if exists "compilation_events" cascade;

CREATE TABLE "users"
(
    "id"    bigint generated always as identity not null primary key,
    "name"  varchar,
    "email" varchar
);

CREATE TABLE "categories"
(
    "id"   bigint generated always as identity not null primary key,
    "name" varchar
);

CREATE TABLE "compilations"
(
    "id"     bigint generated always as identity not null primary key,
    "pinned" boolean,
    "title"  varchar
);

CREATE TABLE "participation_requests"
(
    "id"          bigint PRIMARY KEY,
    "eventId"     bigint,
    "created"     timestamp with time zone,
    "requestorId" bigint,
    "status"      varchar
);

CREATE TABLE "events"
(
    "id"                 bigint generated always as identity not null primary key,
    "annotation"         varchar,
    "title"              varchar,
    "description"        varchar,
    "category_id"        bigint,
    "initiator_id"       bigint,
    "compilation_id"     bigint,
    "confirmed_requests" bigint,
    "participant_limit"  bigint,
    "location"           point,
    "created_on"         timestamp with time zone,
    "published_on"       timestamp with time zone,
    "event_date"         timestamp with time zone,
    "state"              varchar,
    "paid"               boolean,
    "views"              bigint,
    "request_moderation" boolean
);

CREATE TABLE "comments"
(
    "id"       bigint generated always as identity not null primary key,
    "eventId"  bigint,
    "authorId" bigint,
    "comment"  varchar,
    "created"  timestamp with time zone
);

CREATE TABLE "compilation_events"
(
    "compilationId" bigint,
    "eventId"       bigint,
    PRIMARY KEY ("compilationId", "eventId")
);

ALTER TABLE "participation_requests"
    ADD FOREIGN KEY ("eventId") REFERENCES "events" ("id");

ALTER TABLE "participation_requests"
    ADD FOREIGN KEY ("requestorId") REFERENCES "users" ("id");

ALTER TABLE "events"
    ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "events"
    ADD FOREIGN KEY ("initiator_id") REFERENCES "users" ("id");

ALTER TABLE "events"
    ADD FOREIGN KEY ("compilation_id") REFERENCES "compilations" ("id");

ALTER TABLE "comments"
    ADD FOREIGN KEY ("eventId") REFERENCES "events" ("id");

ALTER TABLE "comments"
    ADD FOREIGN KEY ("authorId") REFERENCES "users" ("id");

ALTER TABLE "compilation_events"
    ADD FOREIGN KEY ("compilationId") REFERENCES "compilations" ("id");

ALTER TABLE "compilation_events"
    ADD FOREIGN KEY ("eventId") REFERENCES "events" ("id");
