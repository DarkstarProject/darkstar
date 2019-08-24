-----------------------------------
--  Trust: Shantotto_II
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/utils")
require("scripts/globals/trusts")
require("scripts/globals/msg")

function onTrustSpawn(trust)
    local master = trust:getName();
	if master:hasTrust(dsp.trust.AJIDO_MARUJIDO) then
		trust:PrintToArea("Ajido-Marujido, tell me the truth. Are you following my teachings, or are your techniques still uncouth?", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	elseif master:hasTrust(dsp.trust.KORU_MORU) then
		trust:PrintToArea("Ah, Koru-Moru, debtor extraordinaire. When it comes to running away, you've got a certain...flair.", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	elseif master:hasTrust(dsp.trust.STAR_SIBYL) then
		trust:PrintToArea("Ah, look who it is--a presence most divine. But when it comes to true power, I'm the most sublime!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	elseif master:hasTrust(dsp.trust.KING_OF_HEARTS) then
		trust:PrintToArea("Oh dearie me, this one will need an overhaul once we return to the Manustery...", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	else
		trust:PrintToArea("It's far too late for your foes to make amends, and with me at your side, they'll meet untimely ends!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
	end;
end;

function onTrustEngaged(trust,target)
end;

function onTrustDisengage(trust,target)
	trust:startCasting();
end;

function onTrustFight(trust,target)
    local master = trust:getMaster();
	if(target:hasTopEnmity(trust)) then
		trust:stopCasting();
	else
		trust:startCasting();
	end
end;

function onTrustDeath(trust, player)
	trust:PrintToArea("I'd love to stay longer and enjoy this little party, but I've got a seminar to attend, and must not be tardy!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end;

function onTrustDespawn(trust)
	trust:PrintToArea("I am hardly amazed at how well I've done, but I have to admit--it's been fun!", dsp.msg.channel.PARTY, dsp.msg.area.PARTY, trust:getName());
end;