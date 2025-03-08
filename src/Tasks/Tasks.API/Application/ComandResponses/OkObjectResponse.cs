
namespace TaskFlow.Tasks.API.Application.Comands;

public class OkObjectResponse<T> : IResponse
{
    public required T Value { get; set; }

    public IResult ToResult()
    {
        return TypedResults.Ok<T>(Value);
    }
}