require("/scripts/globals/settings");
package.loaded["scripts/zones/East_Sarutabaruta/TextIDs"] = nil;
require("/scripts/zones/East_Sarutabaruta/TextIDs");
function OnMobSpawn(mob)
end;
function onMobDeath(mob,killer)
	fov = killer:getVar("fov_regimeid");
	print(fov);
	if (fov == 89) then -- 6 members of the mandy family
		--check to see if they have all mandies killed
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
				tabs = killer:getVar("tabs");
				tabs = tabs+50;
				 killer:setVar("tabs",tabs);
			--	add gil
				 killer:addGil(1500);
				 killer:messageSpecial(6379,1500);
			--	add exp
			--	function needed.
				 killer:addExp(1000);
				 killer:showText(killer,9795);
			--	reset FoV marker.
				 killer:setVar("fov_regimeid",0);
				 killer:setVar("fov_numneeded1",0);
				 killer:setVar("fov_numkilled1",0);
			 end;
		end
	end
end;