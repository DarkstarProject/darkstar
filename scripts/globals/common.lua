-----------------------------------
-- Author:
-- 
-- 
-----------------------------------



-----------------------------------
--  switch
-----------------------------------

function switch(c)
  local swtbl = {
      casevar = c,
      caseof = function (self,code)
       local f
       if (self.casevar) then
         f = code[self.casevar] or code.default
       else
         f = code.missing or code.default
       end
       if f then
         if type(f)=="function" then
           return f(self.casevar,self)
         else
           error("case "..tostring(self.casevar).." not a function")
         end
       end
     end
    }
  return swtbl
end;

-----------------------------------
--  printf
-----------------------------------

function printf(s,...)
	print(s:format(...))
end;

-----------------------------------
--  getMidnight
--  Returns midnight for the current day in epoch format
-----------------------------------

function getMidnight()
	-- Get time in UTC
	local utc = os.date("!*t");

	-- Format it into epoch and return it.  Find upcoming midnight, then adjust with TIMEZONE_OFFSET
	return (os.time{year=utc.year, month=utc.month, day=utc.day, hour=24} + (TIMEZONE_OFFSET * 3600));
end;

-----------------------------------
--  getConquestTally()
--  Returns the end of the current conquest tally
-----------------------------------

function getConquestTally()
	-- Get time in UTC
	local utc = os.date("!*t");

	-- Format it into epoch and return it.  Find end of "today" + (number of full days until end of Saturday * 24 hours) + TIMEZONE_OFFSET
	return (os.time{year=utc.year, month=utc.month, day=utc.day, hour=24} + ((7 - utc.wday) * 86400) + (TIMEZONE_OFFSET * 3600));
end;