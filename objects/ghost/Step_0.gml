/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 20F28766
/// @DnDArgument : "var" "move"
/// @DnDArgument : "value" "1"
if(move == 1)
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Scale
	/// @DnDVersion : 1
	/// @DnDHash : 76FC3001
	/// @DnDParent : 20F28766
	/// @DnDArgument : "xscale" "-1"
	image_xscale = -1;
	image_yscale = 1;
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 09C62251
else
{
	/// @DnDAction : YoYo Games.Instances.Sprite_Scale
	/// @DnDVersion : 1
	/// @DnDHash : 35F79527
	/// @DnDParent : 09C62251
	image_xscale = 1;
	image_yscale = 1;
}

/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 46CBF3B3
/// @DnDArgument : "code" "if((instance_exists(decoy) && decoy.active) || instance_exists(dead_player))$(13_10){$(13_10)	image_alpha = 1;$(13_10)}$(13_10)else$(13_10){$(13_10)	image_alpha = 0;$(13_10)}$(13_10)$(13_10)"
if((instance_exists(decoy) && decoy.active) || instance_exists(dead_player))
{
	image_alpha = 1;
}
else
{
	image_alpha = 0;
}

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 377EEA59
/// @DnDArgument : "var" "vertical"
/// @DnDArgument : "value" "1"
if(vertical == 1)
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 7D0E1905
	/// @DnDParent : 377EEA59
	/// @DnDArgument : "var" "move"
	/// @DnDArgument : "value" "1"
	if(move == 1)
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 59A7FCDD
		/// @DnDParent : 7D0E1905
		/// @DnDArgument : "x" "0"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "4"
		/// @DnDArgument : "y_relative" "1"
		x += 0;
		y += 4;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 1E7002FE
	/// @DnDParent : 377EEA59
	else
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 4E47EF71
		/// @DnDParent : 1E7002FE
		/// @DnDArgument : "x" "0"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "-4"
		/// @DnDArgument : "y_relative" "1"
		x += 0;
		y += -4;
	}
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 334117B8
else
{
	/// @DnDAction : YoYo Games.Common.If_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2B1338F3
	/// @DnDParent : 334117B8
	/// @DnDArgument : "var" "move"
	/// @DnDArgument : "value" "1"
	if(move == 1)
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 1DD28CBF
		/// @DnDParent : 2B1338F3
		/// @DnDArgument : "x" "4"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y" "0"
		/// @DnDArgument : "y_relative" "1"
		x += 4;
		y += 0;
	}

	/// @DnDAction : YoYo Games.Common.Else
	/// @DnDVersion : 1
	/// @DnDHash : 67AB7393
	/// @DnDParent : 334117B8
	else
	{
		/// @DnDAction : YoYo Games.Movement.Jump_To_Point
		/// @DnDVersion : 1
		/// @DnDHash : 45F0282B
		/// @DnDParent : 67AB7393
		/// @DnDArgument : "x" "-4"
		/// @DnDArgument : "x_relative" "1"
		/// @DnDArgument : "y_relative" "1"
		x += -4;
	}
}