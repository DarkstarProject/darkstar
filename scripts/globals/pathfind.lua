-- Util methods for pathfinding

pathfind = {};

-- returns the point at the given index
function pathfind.get(points, index)
	local pos = {};

	pos[1] = points[index*3-2];
	pos[2] = points[index*3-1];
	pos[3] = points[index*3];

	return pos;
end;

function pathfind.first(points)
	return pathfind.get(points, 1);
end;

-- returns the last point
function pathfind.last(points)
	local length = table.getn(points);

	return pathfind.get(points, length/3);
end;

-- returns a random point from given point array
function pathfind.random(points)
	local length = table.getn(points);

	return pathfind.get(points, math.random(length));
end;

-- returns the start path without the first element
function pathfind.fromStart(points)
	local t2 = {}
  for k,v in pairs(points) do
  	if(k > 3) then
	    t2[k-3] = v
	end
  end

  return t2
end;

-- reverses the array and removes the first element
function pathfind.fromEnd(points)
	local t2 = {}

	-- do not add the last element
	local length = table.getn(points) - 3;

	local index = 1;

  for i=1,length,3 do
  	index = length - i - 1

    t2[index] = points[i]
    t2[index+1] = points[i+1]
    t2[index+2] = points[i+2]

  end
  
  return t2
end;

function pathfind.patrol(npc, points)
	if(npc:atPoint(pathfind.first(points))) then

		npc:walkThrough(pathfind.fromStart(points));
	elseif(npc:atPoint(pathfind.last(points))) then

		npc:walkThrough(pathfind.fromEnd(points));
	end
end;
