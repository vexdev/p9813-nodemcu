require('HttpServer')
require('p9813')

local app = express.new()
local led = p9813.new()
app:listen()

-- Define a new middleware that prints the url of every request
app:use(function(req,res,next) 
    print(req.url)
    next()
end)

-- Serve the file `index.html` when visiting `/`
app:use('/',express.static('index.html'))

-- Create a new route at `/rgb` and handle the color setting
app:post('/rgb',function(req,res)
    local lines = req.raw:gmatch("[^\r\n]+")
    for line in lines do
        if string.sub(line,1,6)=="color=" then
	    print("Received request to color: "..line)
            r = tonumber(string.sub(line, 10, 11),16)
            g = tonumber(string.sub(line, 12, 13),16)
            b = tonumber(string.sub(line, 14, 15),16)
	    led.draw(0, r, g, b)
        end
    end
end)
