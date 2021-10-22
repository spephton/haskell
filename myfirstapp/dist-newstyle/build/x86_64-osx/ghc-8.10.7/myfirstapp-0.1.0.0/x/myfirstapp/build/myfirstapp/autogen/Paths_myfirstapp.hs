{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_myfirstapp (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/jacob/.cabal/bin"
libdir     = "/Users/jacob/.cabal/lib/x86_64-osx-ghc-8.10.7/myfirstapp-0.1.0.0-inplace-myfirstapp"
dynlibdir  = "/Users/jacob/.cabal/lib/x86_64-osx-ghc-8.10.7"
datadir    = "/Users/jacob/.cabal/share/x86_64-osx-ghc-8.10.7/myfirstapp-0.1.0.0"
libexecdir = "/Users/jacob/.cabal/libexec/x86_64-osx-ghc-8.10.7/myfirstapp-0.1.0.0"
sysconfdir = "/Users/jacob/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "myfirstapp_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myfirstapp_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "myfirstapp_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "myfirstapp_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myfirstapp_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myfirstapp_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
