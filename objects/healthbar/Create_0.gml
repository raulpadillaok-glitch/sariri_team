draw = false;
x1 = x;
y1 = y;
x2 = x;
y2 = y;
amount = 0;
backcol = c_black;
mincol = c_black;
maxcol = c_black;
dir = 0;
showback = true;
showborder = true;

set_vars = function(_draw = draw, _x1 = x1, _y1 = y1, _x2 = x2, _y2 = y2, _amount = amount, _backcol = backcol, _mincol = mincol, _maxcol = maxcol, _dir = dir, _showback = showback, _showborder = showborder)
{
	draw = _draw;
	x1 = _x1;
	y1 = _y1;
	x2 = _x2;
	y2 = _y2;
	amount = _amount;
	backcol = _backcol;
	mincol = _mincol;
	maxcol = _maxcol;
	dir = _dir;
	showback = _showback;
	showborder = _showborder;
}

