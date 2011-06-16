#define MAXCADENA 50
typedef char *cadena;

typedef struct __node_t{
	int index;
	cadena cad;
	struct __node_t *next;
	cadena (*value)();
}node_t;

typedef struct{
	void (*add)(cadena);
	void (*delete)(node_t*);
	node_t *(*find)(cadena);
	struct node_t *first;
}s_list;

void add_f(cadena cad);
void delete_f(node_t *node);
node_t *find_f(cadena cad);
void init();

int assert_equal(cadena *llista1, cadena *llista2);
int assert_nil(node_t *nod);
