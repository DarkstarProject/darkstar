-------------------------------------------------
--	Author: Setzor : setzor@gmail.com
--	Fishing functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Fishing
--      http://ffxi.somepage.com/guides/fishing-other.php
-------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/utils");

function onFishingStart(player)

end;

function onFishingAction(player)

end;

function onFishingCheck(player,fishskilllevel,rod,fishlist,moblist,areaid,areaname)
    local Caught = 0;
    local Reason = 0;
    local CatchID = 0;
    local CatchType = 0;
    local CatchLevel = 0;
    local CatchSize = 0;
    local Count = 0;
    local Stamina = 0;
    local Delay = 0;
    local Regen = 0;
    local Movement = 0;
    local AttackDmg = 0;
    local Heal = 0;
    local TimeLimit = 0;
    local Sense = 0;
    local HookSense = 0;
    local Special = 0;
    local SizeType = 0;
    local SuccessType = 0;

    local FishingSkill = math.floor(fishskilllevel/10);

    local StaminaRandomizer = math.random(95,105);

    -- Create catch pool
    local FishWeight = 0;
    local ItemWeight = 0;
    local MobWeight = 0;
    local NoCatchWeight = 0;
    local TotalPoolWeight = 0;

    local FishPool = {};
    local ItemPool = {};
    local SelectedMob = 0;

    printf("FISHING ROD DETAILS: %u %s",rod.id,rod.name)
    printf("ONFISHINCHECK: %u %s %u %u %u",areaid,areaname,#rod,#fishlist,#moblist)

    -- Get Fish and Item Lists
    for k, fish in pairs(fishlist) do     
        if (fish.maxSkill <= FishingSkill or (fish.maxSkill-FishingSkill) <= 50) then
            local FishItem = {};
            printf("Lure Power: %u",fish.lurePower);
            FishItem["id"] = k;
            if (fish.item == 0) then
                local LevelBonus = (fish.maxSkill-FishingSkill)/5;
                FishItem["weight"] = 30+(fish.lurePower/10)-LevelBonus;
                FishWeight = FishWeight + FishItem["weight"];
                table.insert(FishPool,FishItem);
            end
            if (fish.item == 1) then
                FishItem["weight"] = 15;
                local ItemRandomizer = math.random(1,5);
                printf("FISH RANDOMIZER: %u",ItemRandomizer);
                if (ItemRandomizer > 2) then
                    ItemWeight = ItemWeight + FishItem["weight"];
                    table.insert(ItemPool,FishItem);
                else
                    NoCatchWeight = NoCatchWeight + 5;
                end
            end
        end
    end

    local SelectedMob = 0;
    if (#moblist > 0) then
        local MobItem = {};
        local MobRandomizer = math.random(1,5);
        if (MobRandomizer > 2) then
            SelectedMob = math.random(1,#moblist);
            MobWeight = MobWeight + 15;
        else
            NoCatchWeight = NoCatchWeight + 5;
        end
    end

    TotalPoolWeight = FishWeight + ItemWeight + MobWeight + NoCatchWeight;
    printf("Pool Info - FishCount: %u, ItemCount: %u, TotalPoolWeight: %u",#FishPool,#ItemPool,TotalPoolWeight);

    local PoolSelect = math.random(1,TotalPoolWeight);
    local PoolWeight = 0;
    local HookType = 0;
    local CatchSelected = 0;
    printf("*** POOL SELECTOR: %u",PoolSelect);
    if (#FishPool > 0) then
        printf("* CHECKING FISH POOL");        
        for k,fish in pairs(FishPool) do
            printf("FISH DETAILS: %u %u",fish["id"],fish["weight"]);
            PoolWeight = PoolWeight + fish["weight"];
            if (PoolSelect < PoolWeight) then
                HookType = 1;
                CatchSelect = fish["id"];
                break;
            end
        end
    end
    if (HookType == 0 and #ItemPool > 0) then
        printf("* CHECKING ITEM POOL");        
        for k,item in pairs(ItemPool) do
            printf("ITEM DETAILS: %u %u",item["id"],item["weight"]);
            PoolWeight = PoolWeight + item["weight"];
            if (PoolSelect < PoolWeight) then
                HookType = 2;
                CatchSelect = item["id"];
                break;
            end            
        end
    end
    if (HookType == 0 and SelectedMob > 0) then
        printf("* CHECKING MOB");        
        PoolWeight = PoolWeight + MobWeight
        if (PoolSelect < PoolWeight) then
            HookType = 3;
            CatchSelect = SelectedMob;
        end
    end
    if (HookType > 0) then
        printf("*** CATCH DATA: HookType:%u CatchSelect:%u",HookType,CatchSelect);
        Caught = true;
        TimeLimit = rod.fistime;
        if (HookType == 1 or HookType == 2) then
            SizeType = fishlist[CatchSelect].sizeType;
            -- CATCH ID
            CatchID = fishlist[CatchSelect].id;

            -- SENSE/DELAY/MOVE TYPE
            Delay = fishlist[CatchSelect].baseDelay;
            Movement = fishlist[CatchSelect].baseMove;
            if (fishlist[CatchSelect].sizeType == 0) then                
                Delay = Delay + rod.smdelaybonus;
                Movement = Movement + rod.smmovebonus;
            else
                Delay = Delay + rod.lgdelaybonus;
                Movement = Movement + rod.lgmovebonus;
            end

            -- CATCH LEVEL
            CatchLevel = fishlist[CatchSelect].maxSkill;

            -- CATCH SIZE
            CatchSize = fishlist[CatchSelect].size;
            
            -- CATCH COUNT
            Count = 1;

            -- CATCH TYPE
            if (HookType == 1) then
                if SizeType == 0 then
                    -- Small Fish
                    CatchType = 1;
                    HookSense = 0;
                else
                    -- Large Fish
                    CatchType = 2;
                    HookSense = 1;
                end
            else
                -- Item
                CatchType = 3;
                if SizeType == 0 then
                    -- Small Item
                    HookSense = 0;
                else
                    -- Large Large Item
                    HookSense = 1;
                end
            end
        elseif HookType == 3 then
            -- Mob
            CatchType = 4;
            CatchID = moblist[CatchSelect].id;
            CatchLevel = moblist[CatchSelect].level;
            CatchSize = moblist[CatchSelect].size;
            Delay = moblist[CatchSelect].baseDelay;
            Movement = moblist[CatchSelect].baseMove;
            Delay = Delay + rod.lgdelaybonus;
            Movement = Movement + rod.lgmovebonus;
            Count = 1;
            HookSense = 1;
        end
        -- CATCH STAMINA
        Stamina = StaminaRandomizer * (math.floor((CatchLevel+36)/2));
        -- CATCH ATTACK
        -- (size+floor(size*(rodattack)))*20
        AttackDmg = (CatchSize + math.floor(CatchSize*(rod.fishattack/100)))*20;

    else
        printf("*** DIDN'T CATCH ANYTHING'")
        CatchType = 0;
    end


    Reason = 0;
    -- CatchID = 4472;
    -- CatchType = 1;
    -- CatchLevel = 7;
    -- CatchSize = 24;
    -- Count = 1;
    -- Stamina = 2628;
    -- Delay = 12;
    Regen = 128;
    --Movement = 8;
   --  AttackDmg = 640;
    Heal = 240;
    --TimeLimit = 40;
    Sense = 1;
    Special = 20;

    return Caught,Reason,CatchID,CatchType,CatchLevel,CatchSize,Count,Stamina,Delay,Regen,Movement,AttackDmg,Heal,TimeLimit,Sense,HookSense,Special
end;

function onFishingFinish(player,catchdata,stamina,special)

end;

function onFishingCatch(player)

end;

function onFishingEnd(player)

end;