require("/scripts/globals/settings");
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
require("/scripts/zones/East_Sarutabaruta/TextIDs");
function OnMobSpawn(mob)
end;
function onMobDeath(mob,killer)
-- vars: Gil & exp are the same, tabs are 10% rounded down
gilExp=315;
newTabs=math.floor((gilExp/10));
--
	fov = killer:getVar("fov_regimeid");
	if (fov == 92 and killer:getMainLvl()<16) then -- 4 river crabs
		numneeded = killer:getVar("fov_numneeded1"); 
		numkilled = killer:getVar("fov_numkilled1"); 
		if (numkilled<numneeded) then --increment number killed!
			numkilled = numkilled + 1;
			killer:setVar("fov_numkilled1",numkilled);
			killer:messageBasic(558,numkilled,numneeded);
			 if (numkilled==numneeded) then
			--	completed Regime!
				 killer:messageBasic(559);
			--	give tabs
			-- Needs message to character
				tabs = killer:getVar("tabs");
				tabs = tabs+newTabs;
				 killer:setVar("tabs",tabs);
				 killer:messageBasic(566,newTabs,tabs);
			--	add gil
				 killer:addGil(gilExp);
				 killer:messageSpecial(6379,gilExp);
			--	add exp
				 killer:addExp(gilExp);
				 killer:showText(killer,9795);
			--	reset FoV marker.
				 killer:setVar("fov_regimeid",0);
				 killer:setVar("fov_numneeded1",0);
				 killer:setVar("fov_numkilled1",0);
			 end;
		end
			
	end
end;