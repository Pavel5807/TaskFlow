
namespace TaskFlow.Tasks.API.Application.Comands;

public class NotFoundResponse : IResponse
{
    public IResult ToResult()
    {
        return TypedResults.NotFound();
    }
}
