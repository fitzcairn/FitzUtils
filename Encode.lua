--
-- Encoding routines.
--

-- Namespace
FitzUtilsEncode = { }

--
-- Locals
--

local len      = string.len
local floor    = math.floor
local insert   = table.insert

-- Default base set
local _URL_SET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-.~"


-- Convert a base-10 integer into base |base_chars|, using 
-- base_chars
-- NOTE: based on http://stackoverflow.com/questions/3554315/lua-base-converter
function FitzUtilsEncode:Encode(n, b, base_chars)
   if not b then 
      base_chars = _URL_SET
      b = len(base_chars)
   end
   if not base_chars or len(base_chars) == 0 then
      base_chars = _URL_SET
   end

   n = floor(n)
   if b == 10 then return tostring(n) end -- Easy case

   local t = {}
   local sign = ""
   if n < 0 then
      sign = "-"
      n = -n
   end
   repeat
      local d = (n % b) + 1
      n = floor(n / b)
      insert(t, 1, base_chars:sub(d,d))
   until n == 0
   return sign .. table.concat(t,"")
end
