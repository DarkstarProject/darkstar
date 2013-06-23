require("scripts/globals/status");

-----------------------------------
-- Author: bluekirby0
-- Place convenience functions 
-- related to equipment here
-----------------------------------

function isArtifactArmor(itemid)
	retval = false;
	if    (itemid >= 12511 and itemid <= 12520) then retval = true; -- normal head sets
	elseif(itemid >= 12638 and itemid <= 12650) then retval = true; -- normal body sets
	elseif(itemid >= 13961 and itemid <= 13975) then retval = true; -- normal hand sets
	elseif(itemid >= 14089 and itemid <= 14103) then retval = true; -- normal feet sets
	elseif(itemid >= 14214 and itemid <= 14228) then retval = true; -- normal legs sets
	
	elseif(itemid >= 15265 and itemid <= 15267) then retval = true; -- ToAU head sets
	elseif(itemid >= 14521 and itemid <= 14523) then retval = true; -- ToAU body sets
	elseif(itemid >= 14928 and itemid <= 14930) then retval = true; -- ToAU hand sets
	elseif(itemid >= 15684 and itemid <= 15686) then retval = true; -- ToAU feet sets
	elseif(itemid >= 15600 and itemid <= 15602) then retval = true; -- ToAU legs sets
	
	elseif(itemid >= 16138 and itemid <= 16140) then retval = true; -- WotG head sets
	elseif(itemid >= 14578 and itemid <= 14580) then retval = true; -- WotG body sets
	elseif(itemid >= 15002 and itemid <= 15004) then retval = true; -- WotG hand sets
	elseif(itemid >= 15746 and itemid <= 15748) then retval = true; -- WotG feet sets
	elseif(itemid >= 15659 and itemid <= 15661) then retval = true; -- WotG legs sets
	end
	return retval;
end;

-- Provides a count for the number of pieces of equipment that "enhance the effect of rice balls"
function RiceBalls(player)
   local hands = player:getEquipID(SLOT_HANDS);
   local head = player:getEquipID(SLOT_HEAD);
   local feet = player:getEquipID(SLOT_FEET);
   local power = 0;
   if (hands == 13972 or hands == 14901) then -- Myochin Kote
      power = power + 1;
   end
   if (head == 13910 or head == 13949) then -- Roshi Jinpachi
      power = power + 1;
   end
   if (feet == 11367) then -- Nobushi Kyahan
      power = power + 1;
   end
   return power;
end;