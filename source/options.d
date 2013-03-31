/*****************************************************************************
*
*                      Higgs JavaScript Virtual Machine
*
*  This file is part of the Higgs project. The project is distributed at:
*  https://github.com/maximecb/Higgs
*
*  Copyright (c) 2011-2013, Maxime Chevalier-Boisvert. All rights reserved.
*
*  This software is licensed under the following license (Modified BSD
*  License):
*
*  Redistribution and use in source and binary forms, with or without
*  modification, are permitted provided that the following conditions are
*  met:
*   1. Redistributions of source code must retain the above copyright
*      notice, this list of conditions and the following disclaimer.
*   2. Redistributions in binary form must reproduce the above copyright
*      notice, this list of conditions and the following disclaimer in the
*      documentation and/or other materials provided with the distribution.
*   3. The name of the author may not be used to endorse or promote
*      products derived from this software without specific prior written
*      permission.
*
*  THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED
*  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
*  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN
*  NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
*  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
*  NOT LIMITED TO PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
*  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*
*****************************************************************************/

import std.stdio;
import std.getopt;

struct Options
{
    /// String of code to execute
    string execString = null;

    /// Test mode, disables repl
    bool test = false;

    /// Force a repl
    bool repl = false;

    /// Flag to disable the JIT compiler
    bool jit_disable = false;

    /// Dump machine code generated by the JIT
    bool jit_dumpasm = false;

    /// Dump information about JIT compilation
    bool jit_dumpinfo = false;

    /// Disable sub-traces in the JIT
    bool jit_nosubs = false;
}

/// Global options structure
Options opts;

/**
Parse the command-line arguments
*/
void parseCmdArgs(ref string[] args)
{
    getopt(
        args,
        config.stopOnFirstNonOption,
        config.passThrough,

        "e"             , &opts.execString,
        "test"          , &opts.test,
        "repl"          , &opts.repl,

        "jit_disable"   , &opts.jit_disable,
        "jit_dumpasm"   , &opts.jit_dumpasm,
        "jit_dumpinfo"  , &opts.jit_dumpinfo,
        "jit_nosubs"    , &opts.jit_nosubs
    );
}

