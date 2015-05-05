---------------------------------------------------------------------------------------------------
-- func: @cnation <target> <campaign allegiance>
-- desc: check or alter target characters campaign allegiance
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, nation)
    if (target == nil) then
        player:PrintToPlayer("You must specify an online player by name.");
    else
        local targ = GetPlayerByName( target )
        if (targ == nil) then
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        else
            if (nation == nil) then
                player:PrintToPlayer(string.format("Current Campaign Allegiance: %i", targ:getCampaignAllegiance()));
            else
                player:PrintToPlayer(string.format("Previous Campaign Allegiance: %i", targ:getCampaignAllegiance()));
                targ:setCampaignAllegiance(nation);
                player:PrintToPlayer(string.format("New Campaign Allegiance: %i", targ:getCampaignAllegiance()));
            end
        end
    end
end;