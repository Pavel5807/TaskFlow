
namespace TaskFlow.Tasks.API.Application.Comands;

public class OkResponse : IResponse
{
    public IResult ToResult()
    {
        return TypedResults.Ok();
    }
}
