

#include "Macros.h"

#if defined(DEBUG) || defined(_DEBUG)
#define LOGGING_ON 1
#define LUA_WRAPPER_LOGGING 0
#define FMOD_LOGGING_ON 0
#else
#define LOGGING_ON 0
#define LUA_WRAPPER_LOGGING 0
#define FMOD_LOGGING_ON 0
#endif

#ifdef __cplusplus
extern "C" {
#endif

void _debug_log_v(const char* tag, const char* text, ...) PRINTF(2, 3);
void _debug_log_d(const char* tag, const char* text, ...) PRINTF(2, 3);
void _debug_log_w(const char* tag, const char* text, ...) PRINTF(2, 3);
void _debug_log_e(const char* tag, const char* text, ...) PRINTF(2, 3);

void LUA_WRITE(const char* c);

void _debug_log_assert(const char* cond, const char* tag, const char* fmt, ...);

#ifdef __cplusplus
}
#endif

#define DEBUG_LOG_PRINT_V(tag, fmt, ...)                                                      \
    do {                                                                                      \
        if (LOGGING_ON)                                                                       \
            _debug_log_v(tag, "%s:%d:%s(): " fmt, __FILE__, __LINE__, __func__, __VA_ARGS__); \
    } while (0)
#define DEBUG_LOG_PRINT_D(tag, fmt, ...)                                                      \
    do {                                                                                      \
        if (LOGGING_ON)                                                                       \
            _debug_log_d(tag, "%s:%d:%s(): " fmt, __FILE__, __LINE__, __func__, __VA_ARGS__); \
    } while (0)
#define DEBUG_LOG_PRINT_W(tag, fmt, ...)                                                      \
    do {                                                                                      \
        if (LOGGING_ON)                                                                       \
            _debug_log_w(tag, "%s:%d:%s(): " fmt, __FILE__, __LINE__, __func__, __VA_ARGS__); \
    } while (0)
#define DEBUG_LOG_PRINT_E(tag, fmt, ...)                                                      \
    do {                                                                                      \
        if (LOGGING_ON)                                                                       \
            _debug_log_e(tag, "%s:%d:%s(): " fmt, __FILE__, __LINE__, __func__, __VA_ARGS__); \
    } while (0)

#define DEBUG_LOG_ASSERT_PRINT(cond, tag, fmt, ...)                                                       \
    do {                                                                                                  \
        if (LOGGING_ON)                                                                                   \
            _debug_log_assert(#cond, tag, "%s:%d:%s(): " fmt, __FILE__, __LINE__, __func__, __VA_ARGS__); \
    } while (0)

#define DEBUG_LOG_V(tag, fmt, ...)               \
    do {                                         \
        if (LOGGING_ON)                          \
            _debug_log_v(tag, fmt, __VA_ARGS__); \
    } while (0)
#define DEBUG_LOG_D(tag, fmt, ...)               \
    do {                                         \
        if (LOGGING_ON)                          \
            _debug_log_d(tag, fmt, __VA_ARGS__); \
    } while (0)
#define DEBUG_LOG_W(tag, fmt, ...)               \
    do {                                         \
        if (LOGGING_ON)                          \
            _debug_log_w(tag, fmt, __VA_ARGS__); \
    } while (0)
#define DEBUG_LOG_E(tag, fmt, ...)               \
    do {                                         \
        if (LOGGING_ON)                          \
            _debug_log_e(tag, fmt, __VA_ARGS__); \
    } while (0)

#define DEBUG_LOG_ASSERT(cond, tag, fmt, ...)                \
    do {                                                     \
        if (LOGGING_ON)                                      \
            _debug_log_assert(#cond, tag, fmt, __VA_ARGS__); \
    } while (0)

#ifdef __cplusplus
extern "C" {
#endif

#define DEBUG_LOG_WRITE_V(tag, text) DEBUG_LOG_PRINT_V(tag, "%s", text)
#define DEBUG_LOG_WRITE_D(tag, text) DEBUG_LOG_PRINT_D(tag, "%s", text)
#define DEBUG_LOG_WRITE_W(tag, text) DEBUG_LOG_PRINT_W(tag, "%s", text)
#define DEBUG_LOG_WRITE_E(tag, text) DEBUG_LOG_PRINT_E(tag, "%s", text)

#define DEBUG_LOG_ASSERT_WRITE(cond, tag, text) DEBUG_LOG_ASSERT_PRINT(cond, tag, "%s", text)

#define CRASH(e)                     \
    DEBUG_LOG_WRITE_E("Assert", #e); \
    __builtin_trap()

void njliSleep(unsigned int _ms);

//njli::NJLIGameEngine::PlatformID platformID();
    
    
#ifdef __cplusplus
}
#endif

//njli::NJLIGameEngine::PlatformID platformID();
