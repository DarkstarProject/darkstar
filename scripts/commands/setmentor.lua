---------------------------------------------------------------------------------------------------
-- func: @setmentor <MentorMode> <target>
-- desc: 0 = Not a mentor, 1 = Unlocked but inactive, 2 = Unlocked & flag on.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, MentorMode, target)

    if (MentorMode == nil) then
        player:PrintToPlayer("@setmentor <MentorMode> <target>");
        player:PrintToPlayer("0 = Not a mentor, 1 = Unlocked but inactive, 2 = Unlocked & flag on.");
        return
    end

    if (target == nil) then
        player:setMentor(MentorMode);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:setMentor(MentorMode);
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        end
    end

end;