-----------------------------------
-- Area: The Garden of Ru'Hmet
-- Comments: -- posX, posY, posZ
--(Taken from 'mob_spawn_points' table)
-----------------------------------

-- Ix'Aern (DRG)'s minions - Wynavs
local IxAernDRG = GetMobByID(16921022);
local wynavA = GetMobByID(16921023);
local wynavB = GetMobByID(16921024);
local wynavC = GetMobByID(16921025);	

-- The mob that spawns Ix'Aern (DRG)
local realAwAern_PH = 16920769; -- The actual PH mob.

-- First Aw'Aerns in each group. Used to randomize the mobID as the new placeholder.
local AwAernGroups = {16920777,16920781,16920785,16920789};

-----------------------------------

-- Ix'Aern (DRK) and his RNG minions (Qn'Aerns)
local IxAernDRK = GetMobByID(16921018);
local QnAernA = GetMobByID(16921019);
local QnAernB = GetMobByID(16921020);

-----------------------------------

-- Jailer of Fortitude 
Jailer_of_Fortitude=16921015;

