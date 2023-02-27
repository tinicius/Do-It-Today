enum ActionStatus { done, open }

class Action{
  Action(this.name, this.description, [this.status = ActionStatus.open]);
  ActionStatus status;
  String name;
  String description;
}
