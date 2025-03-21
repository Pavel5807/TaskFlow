CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

START TRANSACTION;
CREATE TABLE "Tasks" (
    "Id" uuid NOT NULL,
    "Header" text NOT NULL,
    CONSTRAINT "PK_Tasks" PRIMARY KEY ("Id")
);

CREATE TABLE "TaskHistories" (
    "Id" uuid NOT NULL,
    "Action" text NOT NULL,
    "TaskId" uuid NOT NULL,
    CONSTRAINT "PK_TaskHistories" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_TaskHistories_Tasks_TaskId" FOREIGN KEY ("TaskId") REFERENCES "Tasks" ("Id") ON DELETE CASCADE
);

CREATE TABLE "TaskItems" (
    "Id" uuid NOT NULL,
    "Description" text NOT NULL,
    "IsCompleted" boolean NOT NULL,
    "TaskId" uuid,
    CONSTRAINT "PK_TaskItems" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_TaskItems_Tasks_TaskId" FOREIGN KEY ("TaskId") REFERENCES "Tasks" ("Id")
);

CREATE INDEX "IX_TaskHistories_TaskId" ON "TaskHistories" ("TaskId");

CREATE INDEX "IX_TaskItems_TaskId" ON "TaskItems" ("TaskId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250308103612_InitialCreate', '9.0.2');

ALTER TABLE "Tasks" ADD "Assignee" jsonb;

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20250321101023_AddAssigneeToTask', '9.0.2');

COMMIT;