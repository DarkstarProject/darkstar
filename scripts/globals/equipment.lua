require("scripts/globals/status");

-----------------------------------
-- Place convenience functions 
-- related to equipment here
-----------------------------------

function isArtifactArmor(itemid)
    retval = false;
    if    ((itemid >= 12511 and itemid <= 12520) or (itemid >= 13855 and itemid <= 13857) or (itemid >= 13868 and itemid <= 13869)) then retval = true; -- normal head sets
    elseif ((itemid >= 12638 and itemid <= 12650) or (itemid >= 13781 and itemid <= 13782)) then retval = true; -- normal body sets
    elseif (itemid >= 13961 and itemid <= 13975) then retval = true; -- normal hand sets
    elseif (itemid >= 14089 and itemid <= 14103) then retval = true; -- normal feet sets
    elseif (itemid >= 14214 and itemid <= 14228) then retval = true; -- normal legs sets

    elseif (itemid >= 15265 and itemid <= 15267) then retval = true; -- ToAU head sets
    elseif (itemid >= 14521 and itemid <= 14523) then retval = true; -- ToAU body sets
    elseif (itemid >= 14928 and itemid <= 14930) then retval = true; -- ToAU hand sets
    elseif (itemid >= 15684 and itemid <= 15686) then retval = true; -- ToAU feet sets
    elseif (itemid >= 15600 and itemid <= 15602) then retval = true; -- ToAU legs sets

    elseif (itemid >= 16138 and itemid <= 16140) then retval = true; -- WotG head sets
    elseif (itemid >= 14578 and itemid <= 14580) then retval = true; -- WotG body sets
    elseif (itemid >= 15002 and itemid <= 15004) then retval = true; -- WotG hand sets
    elseif (itemid >= 15746 and itemid <= 15748) then retval = true; -- WotG feet sets
    elseif (itemid >= 15659 and itemid <= 15661) then retval = true; -- WotG legs sets
    end
    return retval;
end;

-- Provides a power for using a chocobo shirt with bunch of gysahl greens
function ChocoboShirt(player)
    local body = player:getEquipID(SLOT_BODY);
    local power = 0;
    if (body == 10293) then -- Chocobo Shirt
        power = power + 1;
    end
    return power;
end;

-- Provides a power for using a equipment modifiers with bunch of wild pamamas or pamamas
function PamamasEquip(player)
    local head = target:getEquipID(SLOT_HEAD);
    local main = target:getEquipID(SLOT_MAIN);
    local power = 0;
   
    if (head == 13870) then -- Opo-Opo Crown
        power = 1;
    end
    if (main == 17592 or main == 17590) then -- Kinkobo - Primate Staff
        power = 2;
    elseif (main == 17591) then -- Primate Staff +1
        power = 3;
    end
   
    if (head == 13870 and (main == 17592 or main == 17590)) then -- Opo-Opo Crown and Kinkobo or Primate Staff
        power = 4;
    end
   
    if (head == 13870 and main == 17591) then -- Opo-Opo Crown and Primate Staff +1
        power = 5;
    end
    return power;
end;