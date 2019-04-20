

require("scripts/globals/status")
require("scripts/globals/msg")
require("scripts/globals/ability")
require("scripts/globals/weaponskillids")



-- Returns true if a random weapon skill has been performed.
-- Parameter trust  - The trust that may perform the random weapon skill.
-- Parameter wsList - The weapon skill list for the given trust.
function randomWSCheck(trust, target, wsList)
    --Lets only check this every 5 seconds instead of spamming math.random
    if((os.time() - trust:getLocalVar("ws-check")) < 0) then  
		return false 
    else
        --Update ws-check time
		trust:setLocalVar("ws-check", os.time() + 5)
    end
    -- seed our random with os time 
    math.randomseed(os.time())
    local tp = trust:getTP()
    -- If over 2000 then the chance of ws should be much higher.
    if(tp > 2000) then 
        if(math.random(1, 2999) < tp) then
			doRandomWS(trust, target, wsList)
			return true
		end
	elseif(tp > 1000) then 
        if(math.random(1, 100) < 10) then 
			doRandomWS(trust, target, wsList)
			return true
		end
	end
	return false
end

function doRandomWS(trust, target, wsList)
    -- Randomly perform one of the ws's in the list.
	trust:useWeaponSkill(wsList[math.random(1, table.maxn(wsList))], target)
end



function createWSSCListener(target, name)
	target:addListener("WEAPONSKILL_TAKE", name.."_WS", createWSListenerFunction(name.."_WS", name))
end

function createWSListenerFunction(identifier, name)
    return function (mob, attacker, skillID)
        --check if WS is a buff
		if(mob:getID() == attacker:getID()) then 
			return 
		end 
        --Listener is triggered for each hit(?) so check if this is a new skillID before continue
        if(mob:getLocalVar("WS_ID") ~= skillID) then
            --Increment WS counter
            mob:modLocalVar("WS", 1)
            --update our WS_ID with the weapon skill id
            mob:setLocalVar("WS_ID", skillID) 
            --In 6 seconds..decrease the WS counter
			mob:timer(6000, function(this)
				this:modLocalVar("WS", -1)
			end) 
		end

        --If we run and disengage don't leave listeners on the mob
		mob:addListener("DISENGAGE", name.."_WS_CLEANUP", function(this)
			this:removeListener(identifier) 
			this.removeListener(name.."_WS_CLEANUP")
		end)
	end
end


-- Function is to be used in conjunction with the createWSSCListener to check if a weapon skill 
-- is performed on the target and whether a skillchain can be created from the provided wsList parameter
-- Parameter this   - Is the trust that will perform the skillchain
-- Parameter target - The mob that is targetted
-- Parameter wsList - Weapon Skill List; the list of weapon skills to check against.
function skillchainPotential(this, target, wsList)
	--check WS counter
	if(target:getLocalVar("WS") > 0) then 
		--check Naji has enough TP
		if(this:getTP() > 1000) then 
			--get Weapon Skill ID that the mob got hit with
			local a_ws = target:getLocalVar("WS_ID")
			--get Skillchain details from the Weapon Skill ID
			sc = dsp.ws.sc[a_ws]
			--get chaining Weapon Skill ID from Naji's weapon skill list
			b_ws = reduceWSListToChainingWeaponSkill(sc, wsList)
			this:setLocalVar("b_ws", b_ws)
			--result may be 0 if Naji doesn't have any weapon skills that chain with the first.
			if(b_ws ~= 0) then 
				--In 4 seconds fire weapon skill function
				this:timer(4000, function(naji) 
					--check TP so multiple weapon skills are not fired.
					if(naji:getTP() > 1000) then 
						--Grab the most recently worked out b_ws so during the timer if
						--a different ws has been used in the delay we still skillchain!
						local ws = naji:getLocalVar("b_ws")
						--if ws is now 0 we can't skillchain so abort!
						if(ws ~= 0) then 
							naji:useWeaponSkill(b_ws, target)
						end
					end 
				end)
			end
		end
	end
end


-- Returns a weapon skill ID from the provided weapon skills when it would cause a skillchain 
-- to occur based off the Skillchain parameter (sc). 
-- This function prioritises higher level skillchains then will perform checks in the order 
-- of the weapon skill list provided.
-- Parameter sc     - Skillchain information (see weaponskillsid.lua dsp.ws.sc).
-- Parameter wsList - List of Weapon Skill IDs.
-- Returns          - Weapon Skill ID if a valid one exists, otherwise returns nil
function reduceWSListToChainingWeaponSkill(sc, wsList)
	
	local ws = 0
	for i = 4, 2, -1 do 
		if(table.maxn(sc[i]) > 0) then
			ws = reduceWSListFromSpecificSkillchainLevel(sc[i], wsList)
			if(ws ~= 0) then
				return ws
			end
		end
	end
	return ws

end

-- Returns a weapon skill ID from the provided weapon skills when it would cause a skillchain specific 
-- to the skillchain level list provided.
-- This function checks each weapon skill in the provided list in the order of that list. 
-- Parameter list   - List of Skillchain elements that will cause a skillchain to occur. B or C skillchain 
-- respectively.
-- Parameter wsList - List of Weapon Skill IDs.
-- Returns          - Weapon Skill ID if a valid one exists, otherwise returns nil.
function reduceWSListFromSpecificSkillchainLevel(list, wsList)
	for i = 1, table.maxn(list), 1 do
		for j = 1, table.maxn(wsList), 1 do
			if(dsp.ws.sc[wsList[j]][1][1] == list[i]) then
				return wsList[j];
			end
		end
	end
	return 0;
end