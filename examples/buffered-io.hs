import System.Hardware.Serialport
import System.Posix.IO
import qualified Data.ByteString.Char8 as BS
import System.IO


-- Example demonstrate session with arduino device using line oriented protocol

main =
    do port <- openSerial "/dev/ttyUSB0" defaultSerialSettings

       portHandler <- fdToHandle $ fd port

       hReady portHandler >>= print

       readArduino portHandler
       readArduino portHandler
       readArduino portHandler

       closeSerial port
    where readArduino portHandler = BS.hGetLine portHandler >>= BS.putStrLn

