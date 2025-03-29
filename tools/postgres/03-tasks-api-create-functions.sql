CREATE OR REPLACE FUNCTION "UpdateTaskCompletion"(
    "p_TaskIds" UUID[],
    "p_IsCompleted" BOOLEAN
) 
RETURNS VOID 
AS $$
    UPDATE "TaskItems"
    SET "IsCompleted" = "p_IsCompleted"
    WHERE "TaskId" = ANY("p_TaskIds");
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION "GetCompletedTasks"()
RETURNS TABLE ("Id" UUID, "Description" TEXT, "IsCompleted" BOOLEAN, "TaskId" UUID)
AS $$
    SELECT
      "Id",
      "Description",
      "IsCompleted",
      "TaskId"
    FROM "TaskItems"
    WHERE "IsCompleted" = TRUE;
$$ LANGUAGE SQL;