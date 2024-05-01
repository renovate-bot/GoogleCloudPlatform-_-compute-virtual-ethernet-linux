@ rule1 @
identifier napi, budget;
identifier poll_func;
@@
int poll_func(struct napi_struct *napi, int budget)
{
...
}

@ rule2 @
identifier napi, budget;
identifier priv, block;
identifier rule1.poll_func;
@@
int poll_func(struct napi_struct *napi, int budget) {
...
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,11,0))
if (reschedule) {
	if (likely(gve_is_napi_on_home_cpu(priv, block->irq)))
		return budget;
	...
}
+#else /* (LINUX_VERSION_CODE >= KERNEL_VERSION(5,11,0)) */
+	if (reschedule) {
+		return budget;
+	}
+#endif /* (LINUX_VERSION_CODE >= KERNEL_VERSION(5,11,0)) */
...
}

@@
identifier priv, irq;
@@
+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,11,0))
static int gve_is_napi_on_home_cpu(struct gve_priv *priv, u32 irq)
{
...
}
+#endif /* (LINUX_VERSION_CODE >= KERNEL_VERSION(5,11,0)) */
