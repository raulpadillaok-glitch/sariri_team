dialogue_object = instance_create_layer(x, y, "UI", dood_dialogue);
dialogue_object.dialogue = dialogue;
dialogue_object.unlock_spell = unlock_spell;
if(sprite_index == spr_book)
{
	dialogue_object.interact_string = "Press E to read.";
}

