local unrequited = require('unrequited')

local ____this = {}

____this.array,____this.current_ind = {}, 1

function ____this:getrandchar() return string.char(tostring(math.random(65,90))) end

function ____this:getrandnum() return string.char(tostring(math.random(48,57))) end

function ____this:getblank() return " " end

function ____this:init() 
        local i = 0

        -- distractors
        while i < 10 + math.random(10,15) do
                local next_char = ____this:getrandchar()
                ____this.array[i] = next_char
                i = i + 1
        end

        -- T1
        ____this.array[i] = ____this:getrandnum()
        
        -- more distractors
        i = i + 1
        local distractor_len = i
        -- while i < distractor_len + math.random(1,3) do
        while i < distractor_len + math.random(6,8) do
                local next_char = ____this:getrandchar()
                ____this.array[i] = next_char
                i = i + 1
        end

        -- T2
        ____this.array[i] = ____this:getrandnum()

        i = i + 1
        local cum_len = i
        while i < cum_len + math.random(5,7) do
                local next_char = ____this:getrandchar()
                ____this.array[i] = next_char
                i = i + 1
        end

        print(table.concat(____this.array, " "))

        ____this.streamlen = i - 1

end
function ____this:update(n_frames, dt) 
        if ____this.current_ind < ____this.streamlen then
                ____this.current_ind = (math.floor(n_frames/6) % ____this.streamlen) + 1
        end
end
function ____this:draw() 
        love.graphics.print(____this.array[____this.current_ind],320,320,0,10,10,5,5)
end

function ____this:mousepressed(x,y,button,istouch,presses) end
function ____this:mousereleased(x,y,button,istouch,presses) end
function ____this:keypressed(key,scancode,isrepeat) end
function ____this:keyreleased(key,scancode) end

return ____this