-- Util methods for pathfinding

pathfind = {};

PATHFLAG_NONE = 0
PATHFLAG_RUN = 1
PATHFLAG_WALLHACK = 2
PATHFLAG_REVERSE = 4 

-- returns the point at the given index
function pathfind.get(points, index)
    local pos = {};

    if (index < 0) then
    	index = (#points + index - 2) / 3;
    end

    pos[1] = points[index*3-2];
    pos[2] = points[index*3-1];
    pos[3] = points[index*3];

    return pos;
end;

function pathfind.length(points)
    return #points / 3;
end

function pathfind.first(points)
    return pathfind.get(points, 1);
end;

function pathfind.equal(point1, point2)
    return point1[1] == point2[1] and point1[2] == point2[2] and point1[3] == point2[3];
end;

-- returns the last point
function pathfind.last(points)
    local length = #points;

    return pathfind.get(points, length/3);
end;

-- returns a random point from given point array
function pathfind.random(points)
    local length = #points;

    return pathfind.get(points, math.random(1, length));
end;

-- returns the start path without the first element
function pathfind.fromStart(points, start)
    start = start or 1;

    local t2 = {}

    local maxLength = 50;
    local length = pathfind.length(points);

    local count = 1;
    local pos = start + 1;
    local index = 1;

    while pos <= length and count <= maxLength do
        local pt = pathfind.get(points, pos);

        t2[index] = pt[1];
        t2[index+1] = pt[2];
        t2[index+2] = pt[3];

        pos = pos + 1;
        count = count + 1;
        index = index + 3;
    end

  return t2
end;

-- reverses the array and removes the first element
function pathfind.fromEnd(points, start)
    start = start or 1
    local t2 = {}

    -- do not add the last element
    local length = #points / 3;

    start = length - start;

    local index = 1;

  for i=start,1,-1 do
  	local pt = pathfind.get(points, i);

    t2[index] = pt[1]
    t2[index+1] = pt[2]
    t2[index+2] = pt[3]

    index = index + 3

    if (i > 50) then
        break;
    end
  end

  return t2
end;

-- continusly runs the path
function pathfind.patrol(npc, points, flags)

	if (npc:atPoint(pathfind.first(points)) or npc:atPoint(pathfind.last(points))) then
		npc:pathThrough(pathfind.fromStart(points), flags);
	else

		local length = #points / 3;
		local currentLength = 0;
		local i = 51;
		-- i'm some where inbetween
		while(i <= length) do

			if (npc:atPoint(pathfind.get(points, i))) then
				npc:pathThrough(pathfind.fromStart(points, i), flags);
				break;
			end

			i = i + 50;
		end
		
	end

end;