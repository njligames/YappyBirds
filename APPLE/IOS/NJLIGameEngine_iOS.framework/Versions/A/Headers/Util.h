//
//  Util.h
//  JLIGameEngineTest
//
//  Created by James Folk on 11/9/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//

#ifndef JLIGameEngineTest_Util_h
#define JLIGameEngineTest_Util_h

#include "Game.h"
#include "Log.h"
#include <csignal>
#include <cstdlib>
#include <stdio.h>
#include <string>

#ifndef NULL
#define NULL ((void*)0)
#endif

#define PI 3.14159265358979323846264338327f

#if defined(DEBUG) || defined(_DEBUG)
#define JLI_DEBUG
#endif

typedef char s8;
typedef unsigned char u8;
typedef short s16;
typedef unsigned short u16;
typedef int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;
typedef float f32;
typedef double f64;

#define BUFFER_SIZE 512

#if defined(DEBUG) || defined(_DEBUG)
#define DEBUG_GL_ERROR_PRINT(op, fmt, ...)                                                                                                                                                                                                                                                                                                                                                               \
    do {                                                                                                                                                                                                                                                                                                                                                                                                 \
        for (int error = glGetError(); error; error = glGetError()) {                                                                                                                                                                                                                                                                                                                                    \
            DEBUG_LOG_PRINT_E("glGetError", "after %s(" fmt ")", #op, __VA_ARGS__);                                                                                                                                                                                                                                                                                                                      \
            switch (error) {                                                                                                                                                                                                                                                                                                                                                                             \
            case GL_NO_ERROR:                                                                                                                                                                                                                                                                                                                                                                            \
                DEBUG_LOG_WRITE_V("glGetError", "GL_NO_ERROR - No error has been recorded. The value of this symbolic constant is guaranteed to be 0.");                                                                                                                                                                                                                                                 \
                break;                                                                                                                                                                                                                                                                                                                                                                                   \
            case GL_INVALID_ENUM:                                                                                                                                                                                                                                                                                                                                                                        \
                DEBUG_LOG_WRITE_V("glGetError", "GL_INVALID_ENUM - An unacceptable value is specified for an enumerated argument. The offending command is ignored and has no other side effect than to set the error flag.");                                                                                                                                                                           \
                break;                                                                                                                                                                                                                                                                                                                                                                                   \
            case GL_INVALID_VALUE:                                                                                                                                                                                                                                                                                                                                                                       \
                DEBUG_LOG_WRITE_V("glGetError", "GL_INVALID_VALUE - A numeric argument is out of range. The offending command is ignored and has no other side effect than to set the error flag.");                                                                                                                                                                                                     \
                break;                                                                                                                                                                                                                                                                                                                                                                                   \
            case GL_INVALID_OPERATION:                                                                                                                                                                                                                                                                                                                                                                   \
                DEBUG_LOG_WRITE_V("glGetError", "GL_INVALID_OPERATION - The specified operation is not allowed in the current state. The offending command is ignored and has no other side effect than to set the error flag.");                                                                                                                                                                        \
                break;                                                                                                                                                                                                                                                                                                                                                                                   \
            case GL_INVALID_FRAMEBUFFER_OPERATION:                                                                                                                                                                                                                                                                                                                                                       \
                DEBUG_LOG_WRITE_V("glGetError", "GL_INVALID_FRAMEBUFFER_OPERATION - The command is trying to render to or read from the framebuffer while the currently bound framebuffer is not framebuffer complete (i.e. the return value from glCheckFramebufferStatus is not GL_FRAMEBUFFER_COMPLETE). The offending command is ignored and has no other side effect than to set the error flag."); \
                break;                                                                                                                                                                                                                                                                                                                                                                                   \
            case GL_OUT_OF_MEMORY:                                                                                                                                                                                                                                                                                                                                                                       \
                DEBUG_LOG_WRITE_V("glGetError", "GL_OUT_OF_MEMORY - There is not enough memory left to execute the command. The state of the GL is undefined, except for the state of the error flags, after this error is recorded.");                                                                                                                                                                  \
                break;                                                                                                                                                                                                                                                                                                                                                                                   \
            default:                                                                                                                                                                                                                                                                                                                                                                                     \
                DEBUG_LOG_PRINT_V("glGetError", "Unknown (%x)", error);                                                                                                                                                                                                                                                                                                                                  \
            }                                                                                                                                                                                                                                                                                                                                                                                            \
        }                                                                                                                                                                                                                                                                                                                                                                                                \
    } while (0)
#else
#define DEBUG_GL_ERROR_PRINT(op, fmt, ...) \
    {                                      \
    }
#endif

#if defined(DEBUG) || defined(_DEBUG)
#define DEBUG_GL_ERROR_WRITE(op) DEBUG_GL_ERROR_PRINT(op, "%s", "")
#else
#define DEBUG_GL_ERROR_WRITE(op) \
    {                            \
    }
#endif

#if defined(DEBUG) || defined(_DEBUG)
#define DEBUG_ASSERT_PRINT(condition, fmt, ...)                            \
    do {                                                                   \
        if (!(condition)) {                                                \
            DEBUG_LOG_ASSERT_PRINT(condition, "ASSERT", fmt, __VA_ARGS__); \
            __builtin_trap();                                              \
        }                                                                  \
    } while (false)
#else
#define DEBUG_ASSERT_PRINT(condition, fmt, ...) \
    {                                           \
    }
#endif

#if defined(DEBUG) || defined(_DEBUG)
#define DEBUG_ASSERT_WRITE(condition, message) DEBUG_ASSERT_PRINT(#condition, "%s", message)
#else
#define DEBUG_ASSERT_WRITE(condition, message) \
    {                                          \
    }
#endif

#if defined(DEBUG) || defined(_DEBUG)
#define DEBUG_ASSERT(condition)                               \
    do {                                                      \
        if (!(condition)) {                                   \
            DEBUG_LOG_ASSERT_WRITE(#condition, "ASSERT", ""); \
            __builtin_trap();                                 \
        }                                                     \
    } while (false)
#else
#define DEBUG_ASSERT(condition) \
    {                           \
    }
#endif

inline bool IsOn(const s32& value, const s32 bit)
{
    int v = value & bit;
    bool ret = (v == 0) ? false : true;
    return ret;
}

inline u32 On(const s32& value, const s32& bit, bool on = true)
{
    return value | bit;
}

inline u32 Off(const s32 value, const s32& bit)
{
    if (IsOn(value, bit)) {
        return value ^ bit;
    }
    return value;
}

inline f32 clampf(const f32 value, const f32 min, const f32 max)
{
    return (value < min) ? min : ((value > max) ? max : value);
}

inline s32 clamp(const s32 value, const s32 min, const s32 max)
{
    return (value < min) ? min : ((value > max) ? max : value);
}

inline f32 clampColor(const f32 color)
{
    return clampf(color, 0.0f, 1.0f);
}

struct FileData {
public:
    FileData(const void* buffer, s32 size)
    {
        m_buffer = malloc(size);
        m_fileSize = size;
        memcpy(m_buffer, buffer, size);
    }
    ~FileData()
    {
        free(m_buffer);
    }
    const void* getBuffer()
    {
        return m_buffer;
    }
    s32 getSize()
    {
        return m_fileSize;
    }

private:
    void* m_buffer;
    s32 m_fileSize;
};

#endif
