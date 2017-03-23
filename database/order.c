#include <stdio.h>
int main(void)
{	int nbItems = 1000;
	int nbDeliveries = 200000;
	FILE *f = fopen("orders.sql", "w");
	if (f == NULL)
	{
		printf("Error opening file!\n");
		return 0;
	}

	for (int delivery_id = 1; delivery_id <= nbDeliveries; delivery_id++)
	{
		int item_id = delivery_id%(nbItems-1) + 1;
		fprintf(f, "INSERT INTO orders (delivery_id, item_id, email) values (%d, %d, (select a.email from addresses a, deliveries d where a.address_id = d.address_id and d.delivery_id = %d));\n", delivery_id, item_id, delivery_id);
	}
	fclose(f);
	return 0;
}
