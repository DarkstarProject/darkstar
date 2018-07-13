------------------------------------
--
-- NPC PATH WALKING
--
------------------------------------
dsp = dsp or {}

dsp.path =
{
    flag =
    {
        NONE     = 0,
        RUN      = 1,
        WALLHACK = 2,
        REVERSE  = 4,
    },
    
    -- returns the point at the given index
    get = function(points, index)
        local pos = {}

        if index < 0 then
            index = (#points + index - 2) / 3
        end

        pos[1] = points[index*3-2]
        pos[2] = points[index*3-1]
        pos[3] = points[index*3]

        return pos
    end,

    -- returns number of points in given path
    length = function(points)
        return #points / 3
    end,

    -- returns first point in given path
    first = function(points)
        return dsp.path.get(points, 1)
    end,

    -- are two points the same?
    equal = function(point1, point2)
        return point1[1] == point2[1] and point1[2] == point2[2] and point1[3] == point2[3]
    end,

    -- returns last point in given path
    last = function(points)
        local length = dsp.path.length(points)
        return dsp.path.get(points, length)
    end,

    -- returns random point from given path
    random = function(points)
        local length = dsp.path.length(points)
        return dsp.path.get(points, math.random(length))
    end,

    -- returns the start path without the first element
    fromStart = function(points, start)
        start = start or 1
        local t2 = {}
        local maxLength = 50
        local length = dsp.path.length(points)
        local count = 1
        local pos = start + 1
        local index = 1

        while pos <= length and count <= maxLength do
            local pt = dsp.path.get(points, pos)

            t2[index] = pt[1]
            t2[index+1] = pt[2]
            t2[index+2] = pt[3]

            pos = pos + 1
            count = count + 1
            index = index + 3
        end

        return t2
    end,

    -- reverses the array and removes the first element
    fromEnd = function(points, start)
        start = start or 1
        local t2 = {}
        local length = dsp.path.length(points)
        start = length - start
        local index = 1

        for i = start, 1, -1 do
            local pt = dsp.path.get(points, i)

            t2[index] = pt[1]
            t2[index+1] = pt[2]
            t2[index+2] = pt[3]

            index = index + 3

            if i > 50 then
                break
            end
        end

        return t2
    end,

    -- continusly run the path
    patrol = function(npc, points, flags)
        if npc:atPoint(dsp.path.first(points)) or npc:atPoint(dsp.path.last(points)) then
            npc:pathThrough(dsp.path.fromStart(points), flags)
        else
            local length = dsp.path.length(points)
            local currentLength = 0
            local i = 51

            while(i <= length) do
                if npc:atPoint(dsp.path.get(points, i)) then
                    npc:pathThrough(dsp.path.fromStart(points, i), flags)
                    break
                end

                i = i + 50
            end
        end
    end
}