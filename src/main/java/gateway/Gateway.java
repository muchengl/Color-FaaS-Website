package gateway;

import gateway.models.SubmitTaskResponse;
import gateway.models.TaskInstance;

public interface Gateway {
    SubmitTaskResponse submitTask(TaskInstance task);
}
