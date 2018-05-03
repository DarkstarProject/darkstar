---------------------------------------------------------------------------------------------------
-- func: addtitle
-- desc: Add and set player title.
---------------------------------------------------------------------------------------------------

require("scripts/globals/titles");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!addtitle <title ID> {player}");
end;

function onTrigger(player, titleId, target)

    -- validate titleId
    if (titleId == nil) then
        error(player, "You must supply a title ID.");
        return;
    end
    titleId = tonumber(titleId) or dsp.title[string.upper(titleId)];
    if (titleId == nil or titleId < 1) then
        error(player, "Invalid title ID.");
        return;
    end

    -- validate target
    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- add title
    targ:addTitle( titleId );
    player:PrintToPlayer( string.format("%s was given title %s.", targ:getName(), titleId) );
end
