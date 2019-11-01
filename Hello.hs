
-- Compiles JavaScript into machine code
-- usage: ./Hello in-file-js [out-file-exec]

import System.Environment
import System.Directory
import System.FilePath
import Data.Char

-- Based on the args calculate the target file
targetFile :: String -> [String] -> String
targetFile srcFileBase args =
  case args of
    tgtFile : _ -> tgtFile
    [] -> srcFileBase ++ ".out"

-- Compiler
main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "usage: ./Hello [in-file-js] [out-file-exec]"
    srcFile : argsTl ->
      let (srcFileBase, srcFileExts) = splitExtension srcFile in
      if map toLower srcFileExts /= ".js" then
        putStrLn "sorry we only accept .js files"
      else
        copyFile srcFile $ targetFile srcFileBase argsTl

