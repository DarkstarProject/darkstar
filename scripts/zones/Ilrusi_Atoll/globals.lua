-- Zone: Ilrusi Atoll (55)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
require("scripts/zones/Ilrusi_Atoll/MobIDs");
require("scripts/globals/status");
-----------------------------------

ILRUSI_ATOLL = {
    --[[..............................................................................................
        randomize figurehead for golden savage
        ..............................................................................................]]
    randomizeFigurehead = function()
        local figureheadChest = math.random(ILRUSI_CURSED_CHEST_OFFSET, ILRUSI_CURSED_CHEST_OFFSET + 11);
        SetServerVariable("correctcoffer", figureheadChest);
    end,
    
    --[[..............................................................................................
        respawn chests for golden savage
        ..............................................................................................]]
    respawnChests = function()
        for i = ILRUSI_CURSED_CHEST_OFFSET, ILRUSI_CURSED_CHEST_OFFSET + 11 do
            local npc = GetNPCByID(i);
            npc:setStatus(dsp.status.NORMAL);
            npc:setAnimation(90);
        end
        GetNPCByID(ILRUSI_ANCIENT_LOCKBOX):setStatus(dsp.status.DISAPPEAR);
    end,

    --[[..............................................................................................
        despawn remaining mimics for golden savage
        ..............................................................................................]]
    despawnMimics = function()
        for i = ILRUSI_CURSED_CHEST_OFFSET, ILRUSI_CURSED_CHEST_OFFSET + 11 do
            if (GetMobByID(i):isSpawned()) then
                DespawnMob(i);
            end
        end
    end,
}

return ILRUSI_ATOLL;
