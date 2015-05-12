-----------------------------------
-- Area: Sealion den
-- NPC:  Tenzen
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
switch (mob:getID()) : caseof {
[16908310] = function (x)
	GetMobByID(16908311):updateClaim(target);
	GetMobByID(16908312):updateClaim(target);
	GetMobByID(16908313):updateClaim(target);
	end,
[16908314] = function (x)
	GetMobByID(16908315):updateClaim(target);
	GetMobByID(16908316):updateClaim(target);
	GetMobByID(16908317):updateClaim(target);
	end,
[16908318] = function (x)
	GetMobByID(16908319):updateClaim(target);
	GetMobByID(16908320):updateClaim(target);
	GetMobByID(16908321):updateClaim(target);
	end,
                             }
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;