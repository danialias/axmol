/****************************************************************************
 Copyright (c) 2018-2019 Xiamen Yaji Software Co., Ltd.

 https://adxeproject.github.io/

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#include "BufferManager.h"
#include "BufferMTL.h"

CC_BACKEND_BEGIN

std::vector<BufferMTL*> BufferManager::_buffers;

void BufferManager::addBuffer(BufferMTL* buffer)
{
    _buffers.push_back(buffer);
}

void BufferManager::removeBuffer(BufferMTL* buffer)
{
    auto iter = std::find(_buffers.begin(), _buffers.end(), buffer);
    if (_buffers.end() != iter)
        _buffers.erase(iter);
}

void BufferManager::beginFrame()
{
    for (auto& buffer : _buffers)
        buffer->beginFrame();
}

CC_BACKEND_END