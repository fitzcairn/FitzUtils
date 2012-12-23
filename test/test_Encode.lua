-- Unit tests for Util.lua, part of the FitzUtils library.
-- Run from the Binds directory

-- Load up libs required for testing.
require('test/luaunit/luaunit')
require("Util")
require("Encode")

-- Upvalue
local U = FitzUtils;
local E = FitzUtilsEncode;

TestFitzUtilsEncode = {} 
    function TestFitzUtilsEncode:setUp()
       -- Turn off prints
       U:Debug(false)
    end

    -- Hardly exhaustive...
    function TestFitzUtilsEncode:test_encode()
       assert(E:Encode(0) == '0')
       assert(E:Encode(1) == '1')
       assert(E:Encode(9) == '9')
       assert(E:Encode(1289) == 'jz')
       assert(E:Encode(12896) == '2-q')
    end

    -- Test coercion
    function TestFitzUtilsEncode:test_coerce()
       assert(E:Encode('0') == '0')
       assert(E:Encode('1') == '1')
       assert(E:Encode('9') == '9')
       assert(E:Encode('1289') == 'jz')
       assert(E:Encode('12896') == '2-q')
       -- Should fail
       assertError(Encode, E, 'asdfadsf')
   end

-- Run all tests unless overriden on the command line.
LuaUnit:run("TestFitzUtilsEncode")



