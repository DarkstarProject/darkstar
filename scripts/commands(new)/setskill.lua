---------------------------------------------------------------------------------------------------
-- func: @setskill <skill name or ID> <skill level> <target>
-- desc: set specified skill
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sis"
};

function onTrigger(player, skill, skillLV, target)
    local skillList =
    {
        ["h2h"]          = 1,
        ["hand2hand"]    = 1,
        ["handtohand"]   = 1,
        ["dagger"]       = 2,
        ["sword"]        = 3,
        ["gsword"]       = 4,
        ["greatsword"]   = 4,
        ["axe"]          = 5,
        ["gaxe"]         = 6,
        ["greataxe"]     = 6,
        ["scythe"]       = 7,
        ["polearm"]      = 8,
        ["spear"]        = 8,
        ["lance"]        = 8,
        ["katana"]       = 9,
        ["gkatana"]      = 10,
        ["greatkatana"]  = 10,
        ["club"]         = 11,
        ["staff"]        = 12,
        -- 13 to 21 do not exist.
        -- automaton melee     = 22,
        -- automaton archery   = 23,
        -- automaton magic     = 24,
        ["archery"]      = 25,
        ["marksmanship"] = 26,
        ["throwing"]     = 27,
        ["guard"]        = 28,
        ["evasion"]      = 29,
        ["shield"]       = 30,
        ["parry"]        = 31,
        ["divine"]       = 32,
        ["healing"]      = 33,
        ["enhancing"]    = 34,
        ["enfeebling"]   = 35,
        ["elemental"]    = 36,
        ["dark"]         = 37,
        ["summoning"]    = 38,
        ["ninjutsu"]     = 39, -- Correct spelling is "ninjutsu" but
        ["ninjitsu"]     = 39, -- everyone misspells as "ninjitsu" so added both
        ["singing"]      = 40,
        ["string"]       = 41,
        ["wind"]         = 42,
        ["blue"]         = 43,
        ["geomancy"]     = 44,
        ["handbell"]     = 45,
        -- 46 and 47 do not exist.
        ["fishing"]      = 48,
        ["woodworking"]  = 49,
        ["smithing"]     = 50,
        ["goldsmithing"] = 51,
        ["clothcraft"]   = 52,
        ["leathercraft"] = 53,
        ["bonecraft"]    = 54,
        ["alchemy"]      = 55,
        ["cooking"]      = 56,
        ["synergy"]      = 57,
        -- ["riding"]       = 58,
        -- ["digging"]      = 59,
        -- 60+ do not exist.
    }
    local skillID = skillList[string.lower(skill)];
    local targ = nil;

    if (skill == nil) then
        player:PrintToPlayer("Must specify a valid skill.")
        return;
    else
        if (skillID == nil) then
            skillID = tonumber(skill,10);
        end

        if (skillID ~= nil) then
            if (skillID == 0 or (skillID > 12 and skillID < 25)
            or skillID == 46 or skillID == 47 or skillID > 57) then
                player:PrintToPlayer("Must specify a valid skill.")
                return;
            end
        else
            player:PrintToPlayer("Must specify a valid skill.")
            return;
        end
    end

    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target)
        if (targ == nil) then
            player:PrintToPlayer(string.format("Player named '%s' not found!", target));
            return;
        end
    end

    if (skillLV == nil) then
        player:PrintToPlayer(string.format("%s's %s Skill: %u", targ:getName(), skill, targ:getSkillLevel(skillID)))
        if (skillID > 47) then
            player:PrintToPlayer(string.format("%s's %s Rank: %u", targ:getName(), skill, targ:getSkillRank(skillID)))
        end
    else
        if (skillID > 47) then
            if (skillLV >= 0 and skillLV < 8) then
                targ:setSkillRank(skillID,0);   -- Amateur 0-8
            elseif (skillLV >= 8 and skillLV < 18) then
                targ:setSkillRank(skillID,1);   -- Recruit 8-18
            elseif (skillLV >= 18 and skillLV < 28) then
                targ:setSkillRank(skillID,2);   -- Initiate 18-28
            elseif (skillLV >= 28 and skillLV < 38) then
                targ:setSkillRank(skillID,3);   -- Novice 28-38
            elseif (skillLV >= 38 and skillLV < 48) then
                targ:setSkillRank(skillID,4);   -- Apprentice 38-48
            elseif (skillLV >= 48 and skillLV < 58) then
                targ:setSkillRank(skillID,5);   -- Journeyman 48-58
            elseif (skillLV >= 58 and skillLV < 68) then
                targ:setSkillRank(skillID,6);   -- Craftsman 58-68
            elseif (skillLV >= 68 and skillLV < 78) then
                targ:setSkillRank(skillID,7);   -- Artisan" 68-78
            elseif (skillLV >= 78 and skillLV < 88) then
                targ:setSkillRank(skillID,8);   -- Adept 78-88
            elseif (skillLV >= 88 and skillLV < 98) then
                targ:setSkillRank(skillID,9);   -- Veteran 88-98
            elseif (skillLV >= 98 and skillLV < 101) then
                targ:setSkillRank(skillID,10);  -- Expert 98-100
            elseif (skillLV > 100) then
                -- Future editing will be needed here.
                targ:setSkillRank(skillID,10);
                -- 11 = Authority
                -- 12 = Luminary
                -- 13 = master
                -- 14 = Grandmaster
                -- 15 = Legend
                -- 16+ invalid.
            end
        end
        targ:setSkillLevel(skillID, skillLV);
        targ:messageBasic(53, skillID, skillLV);
        player:PrintToPlayer(string.format("%s's new %s Skill: %u", targ:getName(), skill, targ:getSkillLevel(skillID)))
        if (skillID > 47) then
            player:PrintToPlayer(string.format("%s's new %s Rank: %u", targ:getName(), skill, targ:getSkillRank(skillID)))
        end
    end
end;