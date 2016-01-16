-----------------------------------
--
-- EFFECT_TELEPORT
--
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/teleports");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local Teleport = effect:getPower();
    if (target:isMob()) then
        DespawnMob(target:getID())
    elseif (Teleport == TELEPORT_DEM) then
        toDem(target);
    elseif (Teleport == TELEPORT_HOLLA) then
        toHolla(target);
    elseif (Teleport == TELEPORT_YHOAT) then
        toYhoat(target);
    elseif (Teleport == TELEPORT_VAHZL) then
        toVahzl(target);
    elseif (Teleport == TELEPORT_MEA) then
        toMea(target);
    elseif (Teleport == TELEPORT_ALTEP) then
        toAltep(target);
    elseif (Teleport == TELEPORT_WARP) then
        target:warp();
    elseif (Teleport == TELEPORT_ESCAPE) then
        Escape(target, target:getZoneID());
    elseif (Teleport == RECALL_JUGNER) then
        recallJugner(target);
    elseif (Teleport == RECALL_PASHH) then
        recallPashh(target);
    elseif (Teleport == RECALL_MERIPH) then
        recallMeriph(target);
    elseif (Teleport == FIREFLIES_AZOUPH) then
        LeujaoamSanctumExit(target);
    elseif (Teleport == FIREFLIES_BHAFLAU) then
        MamoolJaTrainingExit(target);
    elseif (Teleport == FIREFLIES_ZHAYOLM) then
        LebrosCavernExit(target);
    elseif (Teleport == FIREFLIES_DVUCCA) then
        PeriqiaExit(target);
    elseif (Teleport == FIREFLIES_REEF) then
        IlrusiAtollExit(target);
    elseif (Teleport == FIREFLIES_ALZADAAL) then
        NyzulIsleExit(target);
    elseif (Teleport == FIREFLIES_CUTTER) then
        -- TODO
    elseif (Teleport == FIREFLIES_Z_REM) then
        -- TODO
    elseif (Teleport == FIREFLIES_A_REM) then
        -- TODO
    elseif (Teleport == FIREFLIES_B_REM) then
        BhaflauRemnantsExit(target);
    elseif (Teleport == FIREFLIES_S_REM) then
        SilverSeaRemnantsExit(target);
    elseif (Teleport == TELEPORT_MAAT) then
        toMaat(target);
    elseif (Teleport == TELEPORT_HOMING) then
        homingRing(target);
    elseif (Teleport == TELEPORT_TO_LEADER) then
        toLeader(target);
    elseif (Teleport == TELEPORT_EXITPROMMEA) then
        toExitPromMea(target);
    elseif (Teleport == TELEPORT_EXITPROMHOLLA) then
        toExitPromHolla(target);
    elseif (Teleport == TELEPORT_EXITPROMDEM) then
        toExitPromDem(target);
    elseif (Teleport == TELEPORT_LUFAISE) then
        toLufaise(target);
    end
end;