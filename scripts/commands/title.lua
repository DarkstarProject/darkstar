---------------------------------------------------------------------------------------------------
-- func: title
-- desc: Sets a players title.
---------------------------------------------------------------------------------------------------

require("scripts/globals/titles");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, titleId, target)
    if (titleId == nil) then
        player:PrintToPlayer("You must enter a valid title id.");
        return
    end

    titleId = tonumber(titleId) or _G[string.upper(titleId)];

    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
    end

    if (targ ~= nil) then
        targ:addTitle( titleId );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end
