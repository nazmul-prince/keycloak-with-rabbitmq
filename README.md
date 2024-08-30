# keycloak-with-rabbitmq
Just open the terminal and run the following command (for ubuntu):
./deploy.sh

Then you  will see the following line in the log on success:
 [*] Waiting for messages. To exit press CTRL+C
Then open the keycloak on http://localhost:8080, logged in with adming/admin, import the test-realm.json provided inside keycloak-with-rabbitmq/imports.
Then go to Realm Settings -> Events -> add the Event listeners named role-assignment-listener.
Then assign or unassign any realm roles under a user.
Then you will see the following 2 lines in the log:
keycloak-2-1        |  [x] Sent '56ab8253-b3bc-4f2e-866c-0244748fee18'
receiver-service-1  |  [x] Received '56ab8253-b3bc-4f2e-866c-0244748fee18'
Which means Keckloak have successfully published the user id through the rabbitmq and consumer service succesfully recieved it.
