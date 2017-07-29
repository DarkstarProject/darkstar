---------------------------------------------------------------------------------------------------
-- func: capskill
-- desc: Caps a specific skill.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, skill)
    if (skill == nil) then
        player:PrintToPlayer( "You must enter a valid skill enum." );
        return;
    end

    skill = tonumber(skill) or _G(skill);

    if (tonumber(skill) ~= 0 and tonumber(skill) ~= nil) then
        local skillId = tonumber(skill);
        player:capSkill( skillId );

        for k, v in pairs(skillList) do
            if (v == skillId) then
                player:PrintToPlayer( string.format( "Capped skill '%s'.", k ) );
                return;
            end
        end
    end

    local skillId = skillList[ string.lower( skill ) ];
    if (skillId == nil) then
        player:PrintToPlayer( string.format( "Invalid skill '%s' given.", skill ) );
    else
        player:capSkill( skillId );
        player:PrintToPlayer( string.format( "Capped skill '%s'.", skill ) );
    end
end
