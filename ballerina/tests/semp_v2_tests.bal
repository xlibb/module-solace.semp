// Copyright (c) 2025, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/io;
import ballerina/test;

final Client sempV2 = check new (
    {
        auth: {
            username: "admin",
            password: "admin"
        }
    },
    serviceUrl = "http://localhost:8080/SEMP/v2/config"
);

@test:Config
isolated function testGetQueues() returns error? {
    MsgVpnQueuesResponse response = check sempV2->getMsgVpnQueues(msgVpnName = "default");
    io:println(response);
}

@test:Config
isolated function createQueue() returns error? {
    MsgVpnQueue payload = {
        queueName: "test-queue-1",
        accessType: "exclusive",
        permission: "consume"
    };
    MsgVpnQueueResponse response = check sempV2->createMsgVpnQueue(msgVpnName = "default", payload = payload);
    io:println("Create Queue: \n", response);
    MsgVpnQueuesResponse response2 = check sempV2->getMsgVpnQueues(msgVpnName = "default");
    io:println("List Queues: \n", response2);
}

@test:Config {
    dependsOn: [createQueue]
}
isolated function attachTopicForQueue() returns error? {
    MsgVpnQueueSubscription payload = {
        subscriptionTopic: "asyncapi/t/topic1"
    };
    MsgVpnQueueSubscriptionResponse response = check sempV2->createMsgVpnQueueSubscription(
        msgVpnName = "default", queueName = "test-queue-1", payload = payload
    );
    io:println("Attach topic subscription: \n", response);
}
