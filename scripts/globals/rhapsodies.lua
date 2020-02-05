require("scripts/globals/missions")
require("scripts/globals/status")
------------------------------------

dsp = dsp or {}
dsp.rhapsodies = dsp.rhapsodies or {}

------------------------------------
-- LOCAL FUNCTIONS
------------------------------------
local prisheUnavailable = {
    dsp.mission.id.cop.THE_RITES_OF_LIFE,
    dsp.mission.id.cop.BELOW_THE_ARKS,
    dsp.mission.id.cop.THE_MOTHERCRYSTALS,
    dsp.mission.id.cop.AN_INVITATION_WEST,
    dsp.mission.id.cop.THE_LOST_CITY,
    dsp.mission.id.cop.DISTANT_BELIEFS,
    dsp.mission.id.cop.AN_ETERNAL_MELODY,
    dsp.mission.id.cop.ANCIENT_VOWS,
    dsp.mission.id.cop.DARKNESS_NAMED,
    dsp.mission.id.cop.SLANDEROUS_UTTERINGS,
    dsp.mission.id.cop.DESIRES_OF_EMPTINESS,
    dsp.mission.id.cop.THREE_PATHS,
    dsp.mission.id.cop.FOR_WHOM_THE_VERSE_IS_SUNG,
    dsp.mission.id.cop.A_PLACE_TO_RETURN,
    dsp.mission.id.cop.MORE_QUESTIONS_THAN_ANSWERS,
    dsp.mission.id.cop.ONE_TO_BE_FEARED,
    dsp.mission.id.cop.THE_WARRIOR_S_PATH,
    dsp.mission.id.cop.GARDEN_OF_ANTIQUITY,
    dsp.mission.id.cop.WHEN_ANGELS_FALL,
    dsp.mission.id.cop.DAWN
}

local tenzenUnavailable = {
    dsp.mission.id.cop.THE_RITES_OF_LIFE,
    dsp.mission.id.cop.BELOW_THE_ARKS,
    dsp.mission.id.cop.THE_MOTHERCRYSTALS,
    dsp.mission.id.cop.AN_INVITATION_WEST,
    dsp.mission.id.cop.THE_LOST_CITY,
    dsp.mission.id.cop.DISTANT_BELIEFS,
    dsp.mission.id.cop.AN_ETERNAL_MELODY,
    dsp.mission.id.cop.ANCIENT_VOWS,
    dsp.mission.id.cop.THE_CALL_OF_THE_WYRMKING,
    dsp.mission.id.cop.A_VESSEL_WITHOUT_A_CAPTAIN,
    dsp.mission.id.cop.DESIRES_OF_EMPTINESS,
    dsp.mission.id.cop.THE_WARRIOR_S_PATH,
    dsp.mission.id.cop.GARDEN_OF_ANTIQUITY,
    dsp.mission.id.cop.WHEN_ANGELS_FALL,
    dsp.mission.id.cop.DAWN
}

local function checkCharacterAvailable(characterTable, currentMission)
    for k, v in pairs(characterTable) do
        if v == currentMission then
            return false
        end
    end
    return true
end

------------------------------------
-- PUBLIC FUNCTIONS
------------------------------------
-- Lockout Table:
-- http://forum.square-enix.com/ffxi/threads/47983-What-should-I-do-if-I-can%E2%80%99t-progress-in-Rhapsodies-of-Vana%E2%80%99diel

function dsp.rhapsodies.checkExpansion(player)
    local COPMission = player:getCurrentMission(COP)
    local TOAUMission = player:getCurrentMission(TOAU)
    local WOTGMission = player:getCurrentMission(WOTG)
    local SOAMission = player:getCurrentMission(SOA)
    local ROVMission = player:getCurrentMission(ROV)

    local PrisheAvailable = checkCharacterAvailable(prisheUnavailable, COPMission)
    local TenzenAvailable = checkCharacterAvailable(tenzenUnavailable, COPMission)
    -- TODO:
    -- local AphmauAvailable = checkCharacterAvailable(TOAUMission)
    -- local LilisetteAvailable = checkCharacterAvailable(WOTGMission)
    -- local CaitAvailable = checkCharacterAvailable(WOTGMission)
    -- local ArcielaAvailable = checkCharacterAvailable(SOAMission)

    return PrisheAvailable and TenzenAvailable
end

function dsp.rhapsodies.params(player, expansion)
    local ROVMission = player:getCurrentMission(ROV)
    local RhapsodiesStatus = player:getCharVar("RhapsodiesStatus")

    return { 0, 0, 0, 0, 0, 1 }
end

function dsp.rhapsodies.applyRhapsodyInWhiteBonuses(player)
    -- https://ffxiclopedia.fandom.com/wiki/Rhapsody_in_White

    -- 30% bonus to experience and limit points gains
    player:addMod(dsp.mod.ROV_EXP_MOD, 0.3)

    -- 100% increase to combat and magic skill gains
    player:addMod(dsp.mod.ROV_SKILL_MOD, 1.0)

    -- Allows an additional alter ego to be called forth at once.
    -- 80% reduction in gil consumed by home points

    -- Addition of items for sale by Curio Vendor Moogles located in the three nations

    -- Reduces the amount of gil and tabs consumed by Survival Guides
    -- Reduces the amount of tabs required for the following effects.
end
