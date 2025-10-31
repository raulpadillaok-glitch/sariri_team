/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 19D1F25D
/// @DnDArgument : "var" "vertical"
/// @DnDArgument : "value" "1"
if(vertical == 1)
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5A6A7D75
	/// @DnDParent : 19D1F25D
	/// @DnDArgument : "var" "move"
	/// @DnDArgument : "value" "1"
	if(move == 1)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 3907051C
		/// @DnDParent : 5A6A7D75
		/// @DnDArgument : "var" "move"
		move = 0;
	
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 72F7B23A
		/// @DnDParent : 5A6A7D75
		/// @DnDArgument : "x" "0"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "-4"
		/// @DnDArgument : "y_relative" "1"
		x += 0;
		y += -4;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 03FA274F
	/// @DnDParent : 19D1F25D
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6A6EE718
		/// @DnDParent : 03FA274F
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "move"
		move = 1;
	
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 28E69BDA
		/// @DnDParent : 03FA274F
		/// @DnDArgument : "x" "0"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "4"
		/// @DnDArgument : "y_relative" "1"
		x += 0;
		y += 4;
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 671F8A3A
else
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 45C3BDC1
	/// @DnDParent : 671F8A3A
	/// @DnDArgument : "var" "move"
	/// @DnDArgument : "value" "1"
	if(move == 1)
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 123F6E1D
		/// @DnDParent : 45C3BDC1
		/// @DnDArgument : "var" "move"
		move = 0;
	
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 3CB2F3D1
		/// @DnDParent : 45C3BDC1
		/// @DnDArgument : "x" "-4"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "0"
		/// @DnDArgument : "y_relative" "1"
		x += -4;
		y += 0;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 11E70084
	/// @DnDParent : 671F8A3A
	else
	{
		/// @DnDAction : YoYo Games.Common.Variable
		/// @DnDVersion : 1
		/// @DnDHash : 6C322D76
		/// @DnDParent : 11E70084
		/// @DnDArgument : "expr" "1"
		/// @DnDArgument : "var" "move"
		move = 1;
	
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 10DF4E88
		/// @DnDParent : 11E70084
		/// @DnDArgument : "x" "4"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y_relative" "1"
		x += 4;
	}
}