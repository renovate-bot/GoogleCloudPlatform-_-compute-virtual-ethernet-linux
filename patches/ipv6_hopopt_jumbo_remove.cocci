@@
expression priv;
@@

+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,2,1))
if (!gve_is_gqi(priv))
	netif_set_tso_max_size(priv->dev, GVE_DQO_TX_MAX);
+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(6,2,1) */

@@
expression skb;
@@

+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,2,1))
if (skb_is_gso(skb) && unlikely(ipv6_hopopt_jumbo_remove(skb)))
	goto drop;
+#endif /* LINUX_VERSION_CODE >= KERNEL_VERSION(6,2,1) */
