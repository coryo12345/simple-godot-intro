class_name Conversation
extends Resource

var panels: Array[ConversationElement]
var current_panel_idx: int = 0

func _init(_panels: Array[ConversationElement] = []):
    self.panels = _panels
    self.current_panel_idx = 0


func get_current_panel() -> ConversationElement:
    return self.panels[self.current_panel_idx]


# attempt to set the current panel to the next panel
func set_next_panel() -> bool:
    if self.current_panel_idx + 1 >= len(self.panels):
        return false
    self.current_panel_idx += 1
    return true
